# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
    # Get all html pages (with isPage), order them, and add with default template
    collections:
        pages: ->
            @getCollection("html").findAllLive({isPage:true}, {order: 1}).on "add", (model) ->
                model.setMetaDefaults({layout:"default"})

    # =================================
    # Template Configuration

    # Template Data
    # Use to define your own template data and helpers that will be accessible to your templates
    # Complete listing of default values can be found here: http://docpad.org/docs/template-data
    templateData:

        # Switch that acts as a dictionary to link images to sponsor sites
        sponsors: (sponsor) ->
            switch sponsor
                when "ASML" then "https://www.asml.com/careers/"
                when "DIAMANT" then "http://websites.math.leidenuniv.nl/diamant/"
                when "KHMW" then "http://www.khmw.nl/"
                when "KNAW" then "https://www.knaw.nl/"
                when "KWG" then "https://www.wiskgenoot.nl/"
                when "RUNijmegen" then "http://www.ru.nl/"
                when "TUeindhoven" then "https://www.tue.nl/"
                when "UTwente" then "https://www.utwente.nl/"
                when "UUtrecht" then "http://www.uu.nl/"
                when "UvA" then "http://www.uva.nl/"
                when "VU" then "https://www.vu.nl/"
                when "Wonder" then "http://web.science.uu.nl/wonder/"

                when "GQT" then "http://www.gqt.nl/"
                when "KULeuven" then "https://www.kuleuven.be/"
                when "Optiver" then "http://www.optiver.com/amsterdam/"
                when "RUGroningen" then "http://www.rug.nl/"
                when "Transtrend" then "http://www.transtrend.com/nl/"
                when "TUDelft" then "http://www.tudelft.nl/"
                when "UGent" then "http://www.ugent.be/"
                when "ULeiden" then "http://www.universiteitleiden.nl/"

                when "UMaastricht" then "http://www.maastrichtuniversity.nl/"
                when "Qien" then "http://www.qien.eu/"
                else "#"

        committee_src: "img/commissie/"

        # Sort of a dictionary where the first item of the tuple is the key
        committee_list: [
            {abbr: 'gideon', name: 'Gideon Jager', func: 'Voorzitter'},
            {abbr: 'nick',   name: 'Nick Nauta', func: 'Secretaris'},
            {abbr: 'robin',  name: 'Robin Gravemaker', func: 'Penningmeester'},
            {abbr: 'jeroen', name: 'Jeroen Dekker', func: 'Commissaris Acquisitie'},
            {abbr: 'hugo',   name: 'Hugo Sauerbier Couvée', func: 'Wedstrijdcommissaris'},
            {abbr: 'jeremy', name: 'Jeremy van der Heijden', func: 'Promotiecommissaris'},
            {abbr: 'ismani', name: 'Ismani Nieuweboer', func: 'Commissaris ICT'},
        ]

        # Specify some site properties
        site:
            # The production URL of our website
            url: "/static/limo2016"

            # The default title of our website
            title: "LIMO 2016"

            # The website description (for SEO)
            description: """
                De Landelijke Interuniversitaire Mathematische Olympiade is een wiskundewedstrijd tussen teams van verschillende universiteiten.
                """

            # The website keywords (for SEO) separated by commas
            keywords: """
                LIMO, wiskunde, universiteit, studenten
                """

        favicon: ->
            @site.url + "/img/LIMO_ico.ico"


        # -----------------------------
        # Helper Functions

        # Get the Absolute URL of a document
        getUrl: (document) ->
            return @site.url + (document.url or document.get?('url'))

        # Get the prepared site/document title
        # Often we would like to specify particular formatting to our page's title
        # we can apply that formatting here
        getPreparedTitle: ->
            # if we have a document title, then we should use that and suffix the site's title onto it
            if @document.title
                "#{@document.title} | #{@site.title}"
            # if our document does not have its own title, then we should just use the site's title
            else
                @site.title

        # Get the prepared site/document description
        getPreparedDescription: ->
            # if we have a document description, then we should use that, otherwise use the site's description
            @document.description or @site.description

        # Get the prepared site/document keywords
        getPreparedKeywords: ->
            # Merge the document keywords with the site keywords
            @site.keywords.concat(@document.keywords or []).join(', ')


    # =================================
    # Environments

    # For testing.
    environments:
        development:
            templateData:
                site:
                    url: 'http://localhost:9778'


    # =================================
    # Paths Configuration

    # Some standard options, not particularly interesting.

    # Ignore Paths
    # Can be set to an array of absolute paths that we should ignore from the scanning process
    #ignorePaths: false  # default

    # Ignore Hidden Files
    # Whether or not we should ignore files that start with a dot from the scanning process
    #ignoreHiddenFiles: false  # default

    # Ignore Common Patterns
    # Whether or not we should ignore commonly undesired files from the scanning process
    # (e.g., .DStore, thumbs.db, .git, files that start with a tilda, etc.)
    #ignoreCommonPatterns: true  # default

    # Ignore Custom Patterns
    # Can be set to a regex of custom patterns to ignore from the scanning process
    #ignoreCustomPatterns: false  # default
    #ignoreCustomPatterns: /.bak/

}

# Export the DocPad Configuration
module.exports = docpadConfig
